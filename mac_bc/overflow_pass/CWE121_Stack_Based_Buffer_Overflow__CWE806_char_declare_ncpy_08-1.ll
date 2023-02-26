; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !30
  %call1 = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %6 = load i8*, i8** %data, align 8, !dbg !41
  %call3 = call i64 @strlen(i8* noundef %6), !dbg !41
  %call4 = call i8* @__strncpy_chk(i8* noundef %arraydecay2, i8* noundef %5, i64 noundef %call3, i64 noundef 50) #5, !dbg !41
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !42
  store i8 0, i8* %arrayidx5, align 1, !dbg !43
  %7 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* noundef %7), !dbg !45
  ret void, !dbg !46
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
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_08_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_08_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_08_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !70 {
entry:
  ret i32 1, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  store i8* %arraydecay, i8** %data, align 8, !dbg !80
  %call = call i32 @staticReturnsFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !87
  %1 = load i8*, i8** %data, align 8, !dbg !87
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !87
  %call1 = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !87
  %3 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !93
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !94
  %5 = load i8*, i8** %data, align 8, !dbg !94
  %6 = load i8*, i8** %data, align 8, !dbg !94
  %call3 = call i64 @strlen(i8* noundef %6), !dbg !94
  %call4 = call i8* @__strncpy_chk(i8* noundef %arraydecay2, i8* noundef %5, i64 noundef %call3, i64 noundef 50) #5, !dbg !94
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !95
  store i8 0, i8* %arrayidx5, align 1, !dbg !96
  %7 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* noundef %7), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !100 {
entry:
  ret i32 0, !dbg !101
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !107
  store i8* %arraydecay, i8** %data, align 8, !dbg !108
  %call = call i32 @staticReturnsTrue(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %1 = load i8*, i8** %data, align 8, !dbg !112
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !112
  %call1 = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !112
  %3 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  br label %if.end, !dbg !116

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !119
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !120
  %5 = load i8*, i8** %data, align 8, !dbg !120
  %6 = load i8*, i8** %data, align 8, !dbg !120
  %call3 = call i64 @strlen(i8* noundef %6), !dbg !120
  %call4 = call i8* @__strncpy_chk(i8* noundef %arraydecay2, i8* noundef %5, i64 noundef %call3, i64 noundef 50) #5, !dbg !120
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !121
  store i8 0, i8* %arrayidx5, align 1, !dbg !122
  %7 = load i8*, i8** %data, align 8, !dbg !123
  call void @printLine(i8* noundef %7), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 39, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 40, column: 10, scope: !11)
!25 = !DILocation(line: 41, column: 12, scope: !11)
!26 = !DILocation(line: 41, column: 10, scope: !11)
!27 = !DILocation(line: 42, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!29 = !DILocation(line: 42, column: 8, scope: !11)
!30 = !DILocation(line: 45, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 43, column: 5)
!32 = !DILocation(line: 46, column: 9, scope: !31)
!33 = !DILocation(line: 46, column: 21, scope: !31)
!34 = !DILocation(line: 47, column: 5, scope: !31)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 49, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 49, column: 14, scope: !36)
!41 = !DILocation(line: 51, column: 9, scope: !36)
!42 = !DILocation(line: 52, column: 9, scope: !36)
!43 = !DILocation(line: 52, column: 20, scope: !36)
!44 = !DILocation(line: 53, column: 19, scope: !36)
!45 = !DILocation(line: 53, column: 9, scope: !36)
!46 = !DILocation(line: 55, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_08_good", scope: !12, file: !12, line: 108, type: !13, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!48 = !DILocation(line: 110, column: 5, scope: !47)
!49 = !DILocation(line: 111, column: 5, scope: !47)
!50 = !DILocation(line: 112, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 124, type: !52, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 124, type: !54)
!57 = !DILocation(line: 124, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 124, type: !55)
!59 = !DILocation(line: 124, column: 27, scope: !51)
!60 = !DILocation(line: 127, column: 22, scope: !51)
!61 = !DILocation(line: 127, column: 12, scope: !51)
!62 = !DILocation(line: 127, column: 5, scope: !51)
!63 = !DILocation(line: 129, column: 5, scope: !51)
!64 = !DILocation(line: 130, column: 5, scope: !51)
!65 = !DILocation(line: 131, column: 5, scope: !51)
!66 = !DILocation(line: 134, column: 5, scope: !51)
!67 = !DILocation(line: 135, column: 5, scope: !51)
!68 = !DILocation(line: 136, column: 5, scope: !51)
!69 = !DILocation(line: 138, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !71, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!71 = !DISubroutineType(types: !72)
!72 = !{!54}
!73 = !DILocation(line: 27, column: 5, scope: !70)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 64, type: !17)
!76 = !DILocation(line: 64, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 65, type: !21)
!78 = !DILocation(line: 65, column: 10, scope: !74)
!79 = !DILocation(line: 66, column: 12, scope: !74)
!80 = !DILocation(line: 66, column: 10, scope: !74)
!81 = !DILocation(line: 67, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !12, line: 67, column: 8)
!83 = !DILocation(line: 67, column: 8, scope: !74)
!84 = !DILocation(line: 70, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 68, column: 5)
!86 = !DILocation(line: 71, column: 5, scope: !85)
!87 = !DILocation(line: 75, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !12, line: 73, column: 5)
!89 = !DILocation(line: 76, column: 9, scope: !88)
!90 = !DILocation(line: 76, column: 20, scope: !88)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !12, line: 79, type: !37)
!92 = distinct !DILexicalBlock(scope: !74, file: !12, line: 78, column: 5)
!93 = !DILocation(line: 79, column: 14, scope: !92)
!94 = !DILocation(line: 81, column: 9, scope: !92)
!95 = !DILocation(line: 82, column: 9, scope: !92)
!96 = !DILocation(line: 82, column: 20, scope: !92)
!97 = !DILocation(line: 83, column: 19, scope: !92)
!98 = !DILocation(line: 83, column: 9, scope: !92)
!99 = !DILocation(line: 85, column: 1, scope: !74)
!100 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !71, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!101 = !DILocation(line: 32, column: 5, scope: !100)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 90, type: !17)
!104 = !DILocation(line: 90, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !12, line: 91, type: !21)
!106 = !DILocation(line: 91, column: 10, scope: !102)
!107 = !DILocation(line: 92, column: 12, scope: !102)
!108 = !DILocation(line: 92, column: 10, scope: !102)
!109 = !DILocation(line: 93, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !12, line: 93, column: 8)
!111 = !DILocation(line: 93, column: 8, scope: !102)
!112 = !DILocation(line: 96, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 94, column: 5)
!114 = !DILocation(line: 97, column: 9, scope: !113)
!115 = !DILocation(line: 97, column: 20, scope: !113)
!116 = !DILocation(line: 98, column: 5, scope: !113)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !12, line: 100, type: !37)
!118 = distinct !DILexicalBlock(scope: !102, file: !12, line: 99, column: 5)
!119 = !DILocation(line: 100, column: 14, scope: !118)
!120 = !DILocation(line: 102, column: 9, scope: !118)
!121 = !DILocation(line: 103, column: 9, scope: !118)
!122 = !DILocation(line: 103, column: 20, scope: !118)
!123 = !DILocation(line: 104, column: 19, scope: !118)
!124 = !DILocation(line: 104, column: 9, scope: !118)
!125 = !DILocation(line: 106, column: 1, scope: !102)
