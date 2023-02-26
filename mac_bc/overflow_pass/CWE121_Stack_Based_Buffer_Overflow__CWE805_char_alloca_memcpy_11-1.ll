; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_11_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !29
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx1, align 1, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !44
  %call3 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !45
  store i8 0, i8* %arrayidx4, align 1, !dbg !46
  %8 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* noundef %8), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_11_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_11_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_11_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 50, align 16, !dbg !78
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %1 = alloca i8, i64 100, align 16, !dbg !81
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !80
  %call = call i32 (...) @globalReturnsFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !88
  store i8* %2, i8** %data, align 8, !dbg !90
  %3 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx1, align 1, !dbg !98
  %4 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  %5 = load i8*, i8** %data, align 8, !dbg !99
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !99
  %call3 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !99
  %7 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !100
  store i8 0, i8* %arrayidx4, align 1, !dbg !101
  %8 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* noundef %8), !dbg !103
  ret void, !dbg !104
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 50, align 16, !dbg !110
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %1 = alloca i8, i64 100, align 16, !dbg !113
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !112
  %call = call i32 (...) @globalReturnsTrue(), !dbg !114
  %tobool = icmp ne i32 %call, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !117
  store i8* %2, i8** %data, align 8, !dbg !119
  %3 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !126
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx1, align 1, !dbg !128
  %4 = load i8*, i8** %data, align 8, !dbg !129
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !129
  %5 = load i8*, i8** %data, align 8, !dbg !129
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !129
  %call3 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !129
  %7 = load i8*, i8** %data, align 8, !dbg !130
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !130
  store i8 0, i8* %arrayidx4, align 1, !dbg !131
  %8 = load i8*, i8** %data, align 8, !dbg !132
  call void @printLine(i8* noundef %8), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_11_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 37, scope: !13)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!28 = !DILocation(line: 28, column: 8, scope: !13)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 29, column: 5)
!31 = !DILocation(line: 32, column: 14, scope: !30)
!32 = !DILocation(line: 33, column: 9, scope: !30)
!33 = !DILocation(line: 33, column: 17, scope: !30)
!34 = !DILocation(line: 34, column: 5, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 36, column: 14, scope: !36)
!41 = !DILocation(line: 37, column: 9, scope: !36)
!42 = !DILocation(line: 38, column: 9, scope: !36)
!43 = !DILocation(line: 38, column: 23, scope: !36)
!44 = !DILocation(line: 40, column: 9, scope: !36)
!45 = !DILocation(line: 41, column: 9, scope: !36)
!46 = !DILocation(line: 41, column: 21, scope: !36)
!47 = !DILocation(line: 42, column: 19, scope: !36)
!48 = !DILocation(line: 42, column: 9, scope: !36)
!49 = !DILocation(line: 44, column: 1, scope: !13)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_11_good", scope: !14, file: !14, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!51 = !DILocation(line: 103, column: 5, scope: !50)
!52 = !DILocation(line: 104, column: 5, scope: !50)
!53 = !DILocation(line: 105, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 117, type: !55, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 117, type: !57)
!60 = !DILocation(line: 117, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 117, type: !58)
!62 = !DILocation(line: 117, column: 27, scope: !54)
!63 = !DILocation(line: 120, column: 22, scope: !54)
!64 = !DILocation(line: 120, column: 12, scope: !54)
!65 = !DILocation(line: 120, column: 5, scope: !54)
!66 = !DILocation(line: 122, column: 5, scope: !54)
!67 = !DILocation(line: 123, column: 5, scope: !54)
!68 = !DILocation(line: 124, column: 5, scope: !54)
!69 = !DILocation(line: 127, column: 5, scope: !54)
!70 = !DILocation(line: 128, column: 5, scope: !54)
!71 = !DILocation(line: 129, column: 5, scope: !54)
!72 = !DILocation(line: 131, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 53, type: !3)
!75 = !DILocation(line: 53, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !14, line: 54, type: !3)
!77 = !DILocation(line: 54, column: 12, scope: !73)
!78 = !DILocation(line: 54, column: 36, scope: !73)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !14, line: 55, type: !3)
!80 = !DILocation(line: 55, column: 12, scope: !73)
!81 = !DILocation(line: 55, column: 37, scope: !73)
!82 = !DILocation(line: 56, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !14, line: 56, column: 8)
!84 = !DILocation(line: 56, column: 8, scope: !73)
!85 = !DILocation(line: 59, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !14, line: 57, column: 5)
!87 = !DILocation(line: 60, column: 5, scope: !86)
!88 = !DILocation(line: 64, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !14, line: 62, column: 5)
!90 = !DILocation(line: 64, column: 14, scope: !89)
!91 = !DILocation(line: 65, column: 9, scope: !89)
!92 = !DILocation(line: 65, column: 17, scope: !89)
!93 = !DILocalVariable(name: "source", scope: !94, file: !14, line: 68, type: !37)
!94 = distinct !DILexicalBlock(scope: !73, file: !14, line: 67, column: 5)
!95 = !DILocation(line: 68, column: 14, scope: !94)
!96 = !DILocation(line: 69, column: 9, scope: !94)
!97 = !DILocation(line: 70, column: 9, scope: !94)
!98 = !DILocation(line: 70, column: 23, scope: !94)
!99 = !DILocation(line: 72, column: 9, scope: !94)
!100 = !DILocation(line: 73, column: 9, scope: !94)
!101 = !DILocation(line: 73, column: 21, scope: !94)
!102 = !DILocation(line: 74, column: 19, scope: !94)
!103 = !DILocation(line: 74, column: 9, scope: !94)
!104 = !DILocation(line: 76, column: 1, scope: !73)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!106 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 81, type: !3)
!107 = !DILocation(line: 81, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !14, line: 82, type: !3)
!109 = !DILocation(line: 82, column: 12, scope: !105)
!110 = !DILocation(line: 82, column: 36, scope: !105)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !14, line: 83, type: !3)
!112 = !DILocation(line: 83, column: 12, scope: !105)
!113 = !DILocation(line: 83, column: 37, scope: !105)
!114 = !DILocation(line: 84, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !14, line: 84, column: 8)
!116 = !DILocation(line: 84, column: 8, scope: !105)
!117 = !DILocation(line: 87, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !14, line: 85, column: 5)
!119 = !DILocation(line: 87, column: 14, scope: !118)
!120 = !DILocation(line: 88, column: 9, scope: !118)
!121 = !DILocation(line: 88, column: 17, scope: !118)
!122 = !DILocation(line: 89, column: 5, scope: !118)
!123 = !DILocalVariable(name: "source", scope: !124, file: !14, line: 91, type: !37)
!124 = distinct !DILexicalBlock(scope: !105, file: !14, line: 90, column: 5)
!125 = !DILocation(line: 91, column: 14, scope: !124)
!126 = !DILocation(line: 92, column: 9, scope: !124)
!127 = !DILocation(line: 93, column: 9, scope: !124)
!128 = !DILocation(line: 93, column: 23, scope: !124)
!129 = !DILocation(line: 95, column: 9, scope: !124)
!130 = !DILocation(line: 96, column: 9, scope: !124)
!131 = !DILocation(line: 96, column: 21, scope: !124)
!132 = !DILocation(line: 97, column: 19, scope: !124)
!133 = !DILocation(line: 97, column: 9, scope: !124)
!134 = !DILocation(line: 99, column: 1, scope: !105)
