; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !30
  %call1 = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %data, align 8, !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !35
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !35
  %call2 = call i8* @__memset_chk(i8* noundef %4, i32 noundef 65, i64 noundef 49, i64 noundef %6) #5, !dbg !35
  %7 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 49, !dbg !37
  store i8 0, i8* %arrayidx3, align 1, !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %9 = load i8*, i8** %data, align 8, !dbg !45
  %10 = load i8*, i8** %data, align 8, !dbg !45
  %call5 = call i64 @strlen(i8* noundef %10), !dbg !45
  %mul = mul i64 %call5, 1, !dbg !45
  %call6 = call i8* @__memcpy_chk(i8* noundef %arraydecay4, i8* noundef %9, i64 noundef %mul, i64 noundef 50) #5, !dbg !45
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !46
  store i8 0, i8* %arrayidx7, align 1, !dbg !47
  %11 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* noundef %11), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_12_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* noundef null), !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 noundef %conv), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_12_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_12_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !78
  store i8* %arraydecay, i8** %data, align 8, !dbg !79
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !80
  %tobool = icmp ne i32 %call, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %1 = load i8*, i8** %data, align 8, !dbg !83
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !83
  %call1 = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !83
  %3 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %data, align 8, !dbg !88
  %5 = load i8*, i8** %data, align 8, !dbg !88
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !88
  %call2 = call i8* @__memset_chk(i8* noundef %4, i32 noundef 65, i64 noundef 49, i64 noundef %6) #5, !dbg !88
  %7 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 49, !dbg !90
  store i8 0, i8* %arrayidx3, align 1, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %9 = load i8*, i8** %data, align 8, !dbg !95
  %10 = load i8*, i8** %data, align 8, !dbg !95
  %call5 = call i64 @strlen(i8* noundef %10), !dbg !95
  %mul = mul i64 %call5, 1, !dbg !95
  %call6 = call i8* @__memcpy_chk(i8* noundef %arraydecay4, i8* noundef %9, i64 noundef %mul, i64 noundef 50) #5, !dbg !95
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !96
  store i8 0, i8* %arrayidx7, align 1, !dbg !97
  %11 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* noundef %11), !dbg !99
  ret void, !dbg !100
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocation(line: 27, column: 12, scope: !11)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocation(line: 28, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!29 = !DILocation(line: 28, column: 8, scope: !11)
!30 = !DILocation(line: 31, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 32, column: 9, scope: !31)
!33 = !DILocation(line: 32, column: 21, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocation(line: 37, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !12, line: 35, column: 5)
!37 = !DILocation(line: 38, column: 9, scope: !36)
!38 = !DILocation(line: 38, column: 20, scope: !36)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 41, type: !41)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 41, column: 14, scope: !40)
!45 = !DILocation(line: 43, column: 9, scope: !40)
!46 = !DILocation(line: 44, column: 9, scope: !40)
!47 = !DILocation(line: 44, column: 20, scope: !40)
!48 = !DILocation(line: 45, column: 19, scope: !40)
!49 = !DILocation(line: 45, column: 9, scope: !40)
!50 = !DILocation(line: 47, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_12_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DILocation(line: 83, column: 5, scope: !51)
!53 = !DILocation(line: 84, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !55, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 96, type: !57)
!60 = !DILocation(line: 96, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 96, type: !58)
!62 = !DILocation(line: 96, column: 27, scope: !54)
!63 = !DILocation(line: 99, column: 22, scope: !54)
!64 = !DILocation(line: 99, column: 12, scope: !54)
!65 = !DILocation(line: 99, column: 5, scope: !54)
!66 = !DILocation(line: 101, column: 5, scope: !54)
!67 = !DILocation(line: 102, column: 5, scope: !54)
!68 = !DILocation(line: 103, column: 5, scope: !54)
!69 = !DILocation(line: 106, column: 5, scope: !54)
!70 = !DILocation(line: 107, column: 5, scope: !54)
!71 = !DILocation(line: 108, column: 5, scope: !54)
!72 = !DILocation(line: 110, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 57, type: !17)
!75 = !DILocation(line: 57, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !12, line: 58, type: !21)
!77 = !DILocation(line: 58, column: 10, scope: !73)
!78 = !DILocation(line: 59, column: 12, scope: !73)
!79 = !DILocation(line: 59, column: 10, scope: !73)
!80 = !DILocation(line: 60, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !73, file: !12, line: 60, column: 8)
!82 = !DILocation(line: 60, column: 8, scope: !73)
!83 = !DILocation(line: 63, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !12, line: 61, column: 5)
!85 = !DILocation(line: 64, column: 9, scope: !84)
!86 = !DILocation(line: 64, column: 20, scope: !84)
!87 = !DILocation(line: 65, column: 5, scope: !84)
!88 = !DILocation(line: 69, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !12, line: 67, column: 5)
!90 = !DILocation(line: 70, column: 9, scope: !89)
!91 = !DILocation(line: 70, column: 20, scope: !89)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !12, line: 73, type: !41)
!93 = distinct !DILexicalBlock(scope: !73, file: !12, line: 72, column: 5)
!94 = !DILocation(line: 73, column: 14, scope: !93)
!95 = !DILocation(line: 75, column: 9, scope: !93)
!96 = !DILocation(line: 76, column: 9, scope: !93)
!97 = !DILocation(line: 76, column: 20, scope: !93)
!98 = !DILocation(line: 77, column: 19, scope: !93)
!99 = !DILocation(line: 77, column: 9, scope: !93)
!100 = !DILocation(line: 79, column: 1, scope: !73)
