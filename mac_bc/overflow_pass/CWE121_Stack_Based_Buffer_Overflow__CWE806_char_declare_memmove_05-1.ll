; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !36
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !46
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !47
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !47
  %mul = mul i64 %call2, 1, !dbg !47
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef %mul, i64 noundef 50) #5, !dbg !47
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !48
  store i8 0, i8* %arrayidx4, align 1, !dbg !49
  %8 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* noundef %8), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_05_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* noundef null), !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 noundef %conv), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_05_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_05_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !80
  store i8* %arraydecay, i8** %data, align 8, !dbg !81
  %0 = load i32, i32* @staticFalse, align 4, !dbg !82
  %tobool = icmp ne i32 %0, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !88
  %2 = load i8*, i8** %data, align 8, !dbg !88
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !88
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %6 = load i8*, i8** %data, align 8, !dbg !95
  %7 = load i8*, i8** %data, align 8, !dbg !95
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !95
  %mul = mul i64 %call2, 1, !dbg !95
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef %mul, i64 noundef 50) #5, !dbg !95
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !96
  store i8 0, i8* %arrayidx4, align 1, !dbg !97
  %8 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* noundef %8), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !106
  store i8* %arraydecay, i8** %data, align 8, !dbg !107
  %0 = load i32, i32* @staticTrue, align 4, !dbg !108
  %tobool = icmp ne i32 %0, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !111
  %2 = load i8*, i8** %data, align 8, !dbg !111
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !111
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !118
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !119
  %6 = load i8*, i8** %data, align 8, !dbg !119
  %7 = load i8*, i8** %data, align 8, !dbg !119
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !119
  %mul = mul i64 %call2, 1, !dbg !119
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef %mul, i64 noundef 50) #5, !dbg !119
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !120
  store i8 0, i8* %arrayidx4, align 1, !dbg !121
  %8 = load i8*, i8** %data, align 8, !dbg !122
  call void @printLine(i8* noundef %8), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 26, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_05_bad", scope: !9, file: !9, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DILocation(line: 32, column: 12, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !9, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 10, scope: !18)
!31 = !DILocation(line: 34, column: 12, scope: !18)
!32 = !DILocation(line: 34, column: 10, scope: !18)
!33 = !DILocation(line: 35, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !9, line: 35, column: 8)
!35 = !DILocation(line: 35, column: 8, scope: !18)
!36 = !DILocation(line: 38, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !9, line: 36, column: 5)
!38 = !DILocation(line: 39, column: 9, scope: !37)
!39 = !DILocation(line: 39, column: 21, scope: !37)
!40 = !DILocation(line: 40, column: 5, scope: !37)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !9, line: 42, type: !43)
!42 = distinct !DILexicalBlock(scope: !18, file: !9, line: 41, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 42, column: 14, scope: !42)
!47 = !DILocation(line: 44, column: 9, scope: !42)
!48 = !DILocation(line: 45, column: 9, scope: !42)
!49 = !DILocation(line: 45, column: 20, scope: !42)
!50 = !DILocation(line: 46, column: 19, scope: !42)
!51 = !DILocation(line: 46, column: 9, scope: !42)
!52 = !DILocation(line: 48, column: 1, scope: !18)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_05_good", scope: !9, file: !9, line: 101, type: !19, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!54 = !DILocation(line: 103, column: 5, scope: !53)
!55 = !DILocation(line: 104, column: 5, scope: !53)
!56 = !DILocation(line: 105, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 117, type: !58, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!58 = !DISubroutineType(types: !59)
!59 = !{!10, !10, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !9, line: 117, type: !10)
!62 = !DILocation(line: 117, column: 14, scope: !57)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !9, line: 117, type: !60)
!64 = !DILocation(line: 117, column: 27, scope: !57)
!65 = !DILocation(line: 120, column: 22, scope: !57)
!66 = !DILocation(line: 120, column: 12, scope: !57)
!67 = !DILocation(line: 120, column: 5, scope: !57)
!68 = !DILocation(line: 122, column: 5, scope: !57)
!69 = !DILocation(line: 123, column: 5, scope: !57)
!70 = !DILocation(line: 124, column: 5, scope: !57)
!71 = !DILocation(line: 127, column: 5, scope: !57)
!72 = !DILocation(line: 128, column: 5, scope: !57)
!73 = !DILocation(line: 129, column: 5, scope: !57)
!74 = !DILocation(line: 131, column: 5, scope: !57)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 55, type: !19, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!76 = !DILocalVariable(name: "data", scope: !75, file: !9, line: 57, type: !23)
!77 = !DILocation(line: 57, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !9, line: 58, type: !27)
!79 = !DILocation(line: 58, column: 10, scope: !75)
!80 = !DILocation(line: 59, column: 12, scope: !75)
!81 = !DILocation(line: 59, column: 10, scope: !75)
!82 = !DILocation(line: 60, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !75, file: !9, line: 60, column: 8)
!84 = !DILocation(line: 60, column: 8, scope: !75)
!85 = !DILocation(line: 63, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !9, line: 61, column: 5)
!87 = !DILocation(line: 64, column: 5, scope: !86)
!88 = !DILocation(line: 68, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !9, line: 66, column: 5)
!90 = !DILocation(line: 69, column: 9, scope: !89)
!91 = !DILocation(line: 69, column: 20, scope: !89)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !9, line: 72, type: !43)
!93 = distinct !DILexicalBlock(scope: !75, file: !9, line: 71, column: 5)
!94 = !DILocation(line: 72, column: 14, scope: !93)
!95 = !DILocation(line: 74, column: 9, scope: !93)
!96 = !DILocation(line: 75, column: 9, scope: !93)
!97 = !DILocation(line: 75, column: 20, scope: !93)
!98 = !DILocation(line: 76, column: 19, scope: !93)
!99 = !DILocation(line: 76, column: 9, scope: !93)
!100 = !DILocation(line: 78, column: 1, scope: !75)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 81, type: !19, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!102 = !DILocalVariable(name: "data", scope: !101, file: !9, line: 83, type: !23)
!103 = !DILocation(line: 83, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !9, line: 84, type: !27)
!105 = !DILocation(line: 84, column: 10, scope: !101)
!106 = !DILocation(line: 85, column: 12, scope: !101)
!107 = !DILocation(line: 85, column: 10, scope: !101)
!108 = !DILocation(line: 86, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !9, line: 86, column: 8)
!110 = !DILocation(line: 86, column: 8, scope: !101)
!111 = !DILocation(line: 89, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !9, line: 87, column: 5)
!113 = !DILocation(line: 90, column: 9, scope: !112)
!114 = !DILocation(line: 90, column: 20, scope: !112)
!115 = !DILocation(line: 91, column: 5, scope: !112)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !9, line: 93, type: !43)
!117 = distinct !DILexicalBlock(scope: !101, file: !9, line: 92, column: 5)
!118 = !DILocation(line: 93, column: 14, scope: !117)
!119 = !DILocation(line: 95, column: 9, scope: !117)
!120 = !DILocation(line: 96, column: 9, scope: !117)
!121 = !DILocation(line: 96, column: 20, scope: !117)
!122 = !DILocation(line: 97, column: 19, scope: !117)
!123 = !DILocation(line: 97, column: 9, scope: !117)
!124 = !DILocation(line: 99, column: 1, scope: !101)
