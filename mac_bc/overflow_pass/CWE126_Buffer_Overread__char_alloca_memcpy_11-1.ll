; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memcpy_11_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !26
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !26
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !29
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !29
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !30
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !30
  store i8 0, i8* %arrayidx2, align 1, !dbg !31
  %call3 = call i32 (...) @globalReturnsTrue(), !dbg !32
  %tobool = icmp ne i32 %call3, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %10 = load i8*, i8** %dataBadBuffer, align 8, !dbg !35
  store i8* %10, i8** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx4, align 1, !dbg !47
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  %11 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  %call7 = call i64 @strlen(i8* noundef %arraydecay6), !dbg !48
  %mul = mul i64 %call7, 1, !dbg !48
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay5, i8* noundef %11, i64 noundef %mul, i64 noundef 100) #5, !dbg !48
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx9, align 1, !dbg !50
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @printLine(i8* noundef %arraydecay10), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare i32 @globalReturnsTrue(...) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memcpy_11_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* noundef null), !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 noundef %conv), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_11_good(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_11_bad(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 50, align 16, !dbg !82
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %1 = alloca i8, i64 100, align 16, !dbg !85
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !84
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !86
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !86
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !86
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !86
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !89
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !89
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !89
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !89
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !90
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !90
  store i8 0, i8* %arrayidx2, align 1, !dbg !91
  %call3 = call i32 (...) @globalReturnsFalse(), !dbg !92
  %tobool = icmp ne i32 %call3, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !98
  store i8* %10, i8** %data, align 8, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !104
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx4, align 1, !dbg !106
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  %11 = load i8*, i8** %data, align 8, !dbg !107
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  %call7 = call i64 @strlen(i8* noundef %arraydecay6), !dbg !107
  %mul = mul i64 %call7, 1, !dbg !107
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay5, i8* noundef %11, i64 noundef %mul, i64 noundef 100) #5, !dbg !107
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx9, align 1, !dbg !109
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  call void @printLine(i8* noundef %arraydecay10), !dbg !111
  ret void, !dbg !112
}

declare i32 @globalReturnsFalse(...) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 50, align 16, !dbg !118
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %1 = alloca i8, i64 100, align 16, !dbg !121
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !120
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !122
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !122
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !122
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !122
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !125
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !125
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !125
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !125
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !126
  store i8 0, i8* %arrayidx2, align 1, !dbg !127
  %call3 = call i32 (...) @globalReturnsTrue(), !dbg !128
  %tobool = icmp ne i32 %call3, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !131
  store i8* %10, i8** %data, align 8, !dbg !133
  br label %if.end, !dbg !134

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !135, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !138
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !139
  store i8 0, i8* %arrayidx4, align 1, !dbg !140
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  %11 = load i8*, i8** %data, align 8, !dbg !141
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  %call7 = call i64 @strlen(i8* noundef %arraydecay6), !dbg !141
  %mul = mul i64 %call7, 1, !dbg !141
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay5, i8* noundef %11, i64 noundef %mul, i64 noundef 100) #5, !dbg !141
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx9, align 1, !dbg !143
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  call void @printLine(i8* noundef %arraydecay10), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_11_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 5, scope: !13)
!30 = !DILocation(line: 31, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 27, scope: !13)
!32 = !DILocation(line: 32, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!34 = !DILocation(line: 32, column: 8, scope: !13)
!35 = !DILocation(line: 35, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !14, line: 33, column: 5)
!37 = !DILocation(line: 35, column: 14, scope: !36)
!38 = !DILocation(line: 36, column: 5, scope: !36)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !14, line: 38, type: !41)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 38, column: 14, scope: !40)
!45 = !DILocation(line: 39, column: 9, scope: !40)
!46 = !DILocation(line: 40, column: 9, scope: !40)
!47 = !DILocation(line: 40, column: 21, scope: !40)
!48 = !DILocation(line: 43, column: 9, scope: !40)
!49 = !DILocation(line: 44, column: 9, scope: !40)
!50 = !DILocation(line: 44, column: 21, scope: !40)
!51 = !DILocation(line: 45, column: 19, scope: !40)
!52 = !DILocation(line: 45, column: 9, scope: !40)
!53 = !DILocation(line: 47, column: 1, scope: !13)
!54 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_11_good", scope: !14, file: !14, line: 112, type: !15, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DILocation(line: 114, column: 5, scope: !54)
!56 = !DILocation(line: 115, column: 5, scope: !54)
!57 = !DILocation(line: 116, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 128, type: !59, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !14, line: 128, type: !61)
!64 = !DILocation(line: 128, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !14, line: 128, type: !62)
!66 = !DILocation(line: 128, column: 27, scope: !58)
!67 = !DILocation(line: 131, column: 22, scope: !58)
!68 = !DILocation(line: 131, column: 12, scope: !58)
!69 = !DILocation(line: 131, column: 5, scope: !58)
!70 = !DILocation(line: 133, column: 5, scope: !58)
!71 = !DILocation(line: 134, column: 5, scope: !58)
!72 = !DILocation(line: 135, column: 5, scope: !58)
!73 = !DILocation(line: 138, column: 5, scope: !58)
!74 = !DILocation(line: 139, column: 5, scope: !58)
!75 = !DILocation(line: 140, column: 5, scope: !58)
!76 = !DILocation(line: 142, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!78 = !DILocalVariable(name: "data", scope: !77, file: !14, line: 56, type: !3)
!79 = !DILocation(line: 56, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !14, line: 57, type: !3)
!81 = !DILocation(line: 57, column: 12, scope: !77)
!82 = !DILocation(line: 57, column: 36, scope: !77)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !14, line: 58, type: !3)
!84 = !DILocation(line: 58, column: 12, scope: !77)
!85 = !DILocation(line: 58, column: 37, scope: !77)
!86 = !DILocation(line: 59, column: 5, scope: !77)
!87 = !DILocation(line: 60, column: 5, scope: !77)
!88 = !DILocation(line: 60, column: 25, scope: !77)
!89 = !DILocation(line: 61, column: 5, scope: !77)
!90 = !DILocation(line: 62, column: 5, scope: !77)
!91 = !DILocation(line: 62, column: 27, scope: !77)
!92 = !DILocation(line: 63, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !77, file: !14, line: 63, column: 8)
!94 = !DILocation(line: 63, column: 8, scope: !77)
!95 = !DILocation(line: 66, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !14, line: 64, column: 5)
!97 = !DILocation(line: 67, column: 5, scope: !96)
!98 = !DILocation(line: 71, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !14, line: 69, column: 5)
!100 = !DILocation(line: 71, column: 14, scope: !99)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !14, line: 74, type: !41)
!102 = distinct !DILexicalBlock(scope: !77, file: !14, line: 73, column: 5)
!103 = !DILocation(line: 74, column: 14, scope: !102)
!104 = !DILocation(line: 75, column: 9, scope: !102)
!105 = !DILocation(line: 76, column: 9, scope: !102)
!106 = !DILocation(line: 76, column: 21, scope: !102)
!107 = !DILocation(line: 79, column: 9, scope: !102)
!108 = !DILocation(line: 80, column: 9, scope: !102)
!109 = !DILocation(line: 80, column: 21, scope: !102)
!110 = !DILocation(line: 81, column: 19, scope: !102)
!111 = !DILocation(line: 81, column: 9, scope: !102)
!112 = !DILocation(line: 83, column: 1, scope: !77)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!114 = !DILocalVariable(name: "data", scope: !113, file: !14, line: 88, type: !3)
!115 = !DILocation(line: 88, column: 12, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !14, line: 89, type: !3)
!117 = !DILocation(line: 89, column: 12, scope: !113)
!118 = !DILocation(line: 89, column: 36, scope: !113)
!119 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !14, line: 90, type: !3)
!120 = !DILocation(line: 90, column: 12, scope: !113)
!121 = !DILocation(line: 90, column: 37, scope: !113)
!122 = !DILocation(line: 91, column: 5, scope: !113)
!123 = !DILocation(line: 92, column: 5, scope: !113)
!124 = !DILocation(line: 92, column: 25, scope: !113)
!125 = !DILocation(line: 93, column: 5, scope: !113)
!126 = !DILocation(line: 94, column: 5, scope: !113)
!127 = !DILocation(line: 94, column: 27, scope: !113)
!128 = !DILocation(line: 95, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !113, file: !14, line: 95, column: 8)
!130 = !DILocation(line: 95, column: 8, scope: !113)
!131 = !DILocation(line: 98, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !14, line: 96, column: 5)
!133 = !DILocation(line: 98, column: 14, scope: !132)
!134 = !DILocation(line: 99, column: 5, scope: !132)
!135 = !DILocalVariable(name: "dest", scope: !136, file: !14, line: 101, type: !41)
!136 = distinct !DILexicalBlock(scope: !113, file: !14, line: 100, column: 5)
!137 = !DILocation(line: 101, column: 14, scope: !136)
!138 = !DILocation(line: 102, column: 9, scope: !136)
!139 = !DILocation(line: 103, column: 9, scope: !136)
!140 = !DILocation(line: 103, column: 21, scope: !136)
!141 = !DILocation(line: 106, column: 9, scope: !136)
!142 = !DILocation(line: 107, column: 9, scope: !136)
!143 = !DILocation(line: 107, column: 21, scope: !136)
!144 = !DILocation(line: 108, column: 19, scope: !136)
!145 = !DILocation(line: 108, column: 9, scope: !136)
!146 = !DILocation(line: 110, column: 1, scope: !113)
