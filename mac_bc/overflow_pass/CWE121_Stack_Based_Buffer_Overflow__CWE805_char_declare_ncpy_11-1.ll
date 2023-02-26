; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %call = call i32 (...) @globalReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx2, align 1, !dbg !44
  %1 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !45
  %call4 = call i8* @__strncpy_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef 99, i64 noundef %3) #5, !dbg !45
  %4 = load i8*, i8** %data, align 8, !dbg !46
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !46
  store i8 0, i8* %arrayidx5, align 1, !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* noundef %5), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_11_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_11_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_11_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i32 (...) @globalReturnsFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i8* %arraydecay, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !95
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx2, align 1, !dbg !97
  %1 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  %2 = load i8*, i8** %data, align 8, !dbg !98
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !98
  %call4 = call i8* @__strncpy_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef 99, i64 noundef %3) #5, !dbg !98
  %4 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !99
  store i8 0, i8* %arrayidx5, align 1, !dbg !100
  %5 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* noundef %5), !dbg !102
  ret void, !dbg !103
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i32 (...) @globalReturnsTrue(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i8* %arraydecay, i8** %data, align 8, !dbg !116
  %0 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  br label %if.end, !dbg !119

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx2, align 1, !dbg !125
  %1 = load i8*, i8** %data, align 8, !dbg !126
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !126
  %2 = load i8*, i8** %data, align 8, !dbg !126
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !126
  %call4 = call i8* @__strncpy_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef 99, i64 noundef %3) #5, !dbg !126
  %4 = load i8*, i8** %data, align 8, !dbg !127
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !127
  store i8 0, i8* %arrayidx5, align 1, !dbg !128
  %5 = load i8*, i8** %data, align 8, !dbg !129
  call void @printLine(i8* noundef %5), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_11_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 10, scope: !11)
!30 = !DILocation(line: 28, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!32 = !DILocation(line: 28, column: 8, scope: !11)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 14, scope: !34)
!36 = !DILocation(line: 33, column: 9, scope: !34)
!37 = !DILocation(line: 33, column: 17, scope: !34)
!38 = !DILocation(line: 34, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 36, type: !26)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!41 = !DILocation(line: 36, column: 14, scope: !40)
!42 = !DILocation(line: 37, column: 9, scope: !40)
!43 = !DILocation(line: 38, column: 9, scope: !40)
!44 = !DILocation(line: 38, column: 23, scope: !40)
!45 = !DILocation(line: 40, column: 9, scope: !40)
!46 = !DILocation(line: 41, column: 9, scope: !40)
!47 = !DILocation(line: 41, column: 21, scope: !40)
!48 = !DILocation(line: 42, column: 19, scope: !40)
!49 = !DILocation(line: 42, column: 9, scope: !40)
!50 = !DILocation(line: 44, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_11_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DILocation(line: 103, column: 5, scope: !51)
!53 = !DILocation(line: 104, column: 5, scope: !51)
!54 = !DILocation(line: 105, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !56, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 117, type: !58)
!61 = !DILocation(line: 117, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 117, type: !59)
!63 = !DILocation(line: 117, column: 27, scope: !55)
!64 = !DILocation(line: 120, column: 22, scope: !55)
!65 = !DILocation(line: 120, column: 12, scope: !55)
!66 = !DILocation(line: 120, column: 5, scope: !55)
!67 = !DILocation(line: 122, column: 5, scope: !55)
!68 = !DILocation(line: 123, column: 5, scope: !55)
!69 = !DILocation(line: 124, column: 5, scope: !55)
!70 = !DILocation(line: 127, column: 5, scope: !55)
!71 = !DILocation(line: 128, column: 5, scope: !55)
!72 = !DILocation(line: 129, column: 5, scope: !55)
!73 = !DILocation(line: 131, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 53, type: !17)
!76 = !DILocation(line: 53, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !12, line: 54, type: !21)
!78 = !DILocation(line: 54, column: 10, scope: !74)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !12, line: 55, type: !26)
!80 = !DILocation(line: 55, column: 10, scope: !74)
!81 = !DILocation(line: 56, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !12, line: 56, column: 8)
!83 = !DILocation(line: 56, column: 8, scope: !74)
!84 = !DILocation(line: 59, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 57, column: 5)
!86 = !DILocation(line: 60, column: 5, scope: !85)
!87 = !DILocation(line: 64, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !12, line: 62, column: 5)
!89 = !DILocation(line: 64, column: 14, scope: !88)
!90 = !DILocation(line: 65, column: 9, scope: !88)
!91 = !DILocation(line: 65, column: 17, scope: !88)
!92 = !DILocalVariable(name: "source", scope: !93, file: !12, line: 68, type: !26)
!93 = distinct !DILexicalBlock(scope: !74, file: !12, line: 67, column: 5)
!94 = !DILocation(line: 68, column: 14, scope: !93)
!95 = !DILocation(line: 69, column: 9, scope: !93)
!96 = !DILocation(line: 70, column: 9, scope: !93)
!97 = !DILocation(line: 70, column: 23, scope: !93)
!98 = !DILocation(line: 72, column: 9, scope: !93)
!99 = !DILocation(line: 73, column: 9, scope: !93)
!100 = !DILocation(line: 73, column: 21, scope: !93)
!101 = !DILocation(line: 74, column: 19, scope: !93)
!102 = !DILocation(line: 74, column: 9, scope: !93)
!103 = !DILocation(line: 76, column: 1, scope: !74)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 81, type: !17)
!106 = !DILocation(line: 81, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 82, type: !21)
!108 = !DILocation(line: 82, column: 10, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 83, type: !26)
!110 = !DILocation(line: 83, column: 10, scope: !104)
!111 = !DILocation(line: 84, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !12, line: 84, column: 8)
!113 = !DILocation(line: 84, column: 8, scope: !104)
!114 = !DILocation(line: 87, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 85, column: 5)
!116 = !DILocation(line: 87, column: 14, scope: !115)
!117 = !DILocation(line: 88, column: 9, scope: !115)
!118 = !DILocation(line: 88, column: 17, scope: !115)
!119 = !DILocation(line: 89, column: 5, scope: !115)
!120 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 91, type: !26)
!121 = distinct !DILexicalBlock(scope: !104, file: !12, line: 90, column: 5)
!122 = !DILocation(line: 91, column: 14, scope: !121)
!123 = !DILocation(line: 92, column: 9, scope: !121)
!124 = !DILocation(line: 93, column: 9, scope: !121)
!125 = !DILocation(line: 93, column: 23, scope: !121)
!126 = !DILocation(line: 95, column: 9, scope: !121)
!127 = !DILocation(line: 96, column: 9, scope: !121)
!128 = !DILocation(line: 96, column: 21, scope: !121)
!129 = !DILocation(line: 97, column: 19, scope: !121)
!130 = !DILocation(line: 97, column: 9, scope: !121)
!131 = !DILocation(line: 99, column: 1, scope: !104)
