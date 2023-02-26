; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memcpy_14_bad() #0 !dbg !13 {
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
  %10 = load i32, i32* @globalFive, align 4, !dbg !32
  %cmp = icmp eq i32 %10, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %11 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %11, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx3, align 1, !dbg !48
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %12 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %call6 = call i64 @strlen(i8* noundef %arraydecay5), !dbg !49
  %mul = mul i64 %call6, 1, !dbg !49
  %call7 = call i8* @__memcpy_chk(i8* noundef %arraydecay4, i8* noundef %12, i64 noundef %mul, i64 noundef 100) #5, !dbg !49
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx8, align 1, !dbg !51
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @printLine(i8* noundef %arraydecay9), !dbg !53
  ret void, !dbg !54
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memcpy_14_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* noundef null), !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 noundef %conv), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_14_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_14_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 50, align 16, !dbg !83
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %1 = alloca i8, i64 100, align 16, !dbg !86
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !85
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !87
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !87
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !87
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !87
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !90
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !90
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !90
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !90
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !91
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !91
  store i8 0, i8* %arrayidx2, align 1, !dbg !92
  %10 = load i32, i32* @globalFive, align 4, !dbg !93
  %cmp = icmp ne i32 %10, 5, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end, !dbg !99

if.else:                                          ; preds = %entry
  %11 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !100
  store i8* %11, i8** %data, align 8, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !106
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx3, align 1, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  %12 = load i8*, i8** %data, align 8, !dbg !109
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  %call6 = call i64 @strlen(i8* noundef %arraydecay5), !dbg !109
  %mul = mul i64 %call6, 1, !dbg !109
  %call7 = call i8* @__memcpy_chk(i8* noundef %arraydecay4, i8* noundef %12, i64 noundef %mul, i64 noundef 100) #5, !dbg !109
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx8, align 1, !dbg !111
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  call void @printLine(i8* noundef %arraydecay9), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = alloca i8, i64 50, align 16, !dbg !120
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %1 = alloca i8, i64 100, align 16, !dbg !123
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !122
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !124
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !124
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !124
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !124
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !127
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !127
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !127
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !127
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !128
  store i8 0, i8* %arrayidx2, align 1, !dbg !129
  %10 = load i32, i32* @globalFive, align 4, !dbg !130
  %cmp = icmp eq i32 %10, 5, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  %11 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !134
  store i8* %11, i8** %data, align 8, !dbg !136
  br label %if.end, !dbg !137

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !141
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx3, align 1, !dbg !143
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  %12 = load i8*, i8** %data, align 8, !dbg !144
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  %call6 = call i64 @strlen(i8* noundef %arraydecay5), !dbg !144
  %mul = mul i64 %call6, 1, !dbg !144
  %call7 = call i8* @__memcpy_chk(i8* noundef %arraydecay4, i8* noundef %12, i64 noundef %mul, i64 noundef 100) #5, !dbg !144
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !145
  store i8 0, i8* %arrayidx8, align 1, !dbg !146
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  call void @printLine(i8* noundef %arraydecay9), !dbg !148
  ret void, !dbg !149
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_14_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 32, column: 18, scope: !33)
!35 = !DILocation(line: 32, column: 8, scope: !13)
!36 = !DILocation(line: 35, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !14, line: 33, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 5, scope: !37)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !14, line: 38, type: !42)
!41 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 38, column: 14, scope: !41)
!46 = !DILocation(line: 39, column: 9, scope: !41)
!47 = !DILocation(line: 40, column: 9, scope: !41)
!48 = !DILocation(line: 40, column: 21, scope: !41)
!49 = !DILocation(line: 43, column: 9, scope: !41)
!50 = !DILocation(line: 44, column: 9, scope: !41)
!51 = !DILocation(line: 44, column: 21, scope: !41)
!52 = !DILocation(line: 45, column: 19, scope: !41)
!53 = !DILocation(line: 45, column: 9, scope: !41)
!54 = !DILocation(line: 47, column: 1, scope: !13)
!55 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_14_good", scope: !14, file: !14, line: 112, type: !15, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!56 = !DILocation(line: 114, column: 5, scope: !55)
!57 = !DILocation(line: 115, column: 5, scope: !55)
!58 = !DILocation(line: 116, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 128, type: !60, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !14, line: 128, type: !62)
!65 = !DILocation(line: 128, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !14, line: 128, type: !63)
!67 = !DILocation(line: 128, column: 27, scope: !59)
!68 = !DILocation(line: 131, column: 22, scope: !59)
!69 = !DILocation(line: 131, column: 12, scope: !59)
!70 = !DILocation(line: 131, column: 5, scope: !59)
!71 = !DILocation(line: 133, column: 5, scope: !59)
!72 = !DILocation(line: 134, column: 5, scope: !59)
!73 = !DILocation(line: 135, column: 5, scope: !59)
!74 = !DILocation(line: 138, column: 5, scope: !59)
!75 = !DILocation(line: 139, column: 5, scope: !59)
!76 = !DILocation(line: 140, column: 5, scope: !59)
!77 = !DILocation(line: 142, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!79 = !DILocalVariable(name: "data", scope: !78, file: !14, line: 56, type: !3)
!80 = !DILocation(line: 56, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !14, line: 57, type: !3)
!82 = !DILocation(line: 57, column: 12, scope: !78)
!83 = !DILocation(line: 57, column: 36, scope: !78)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !14, line: 58, type: !3)
!85 = !DILocation(line: 58, column: 12, scope: !78)
!86 = !DILocation(line: 58, column: 37, scope: !78)
!87 = !DILocation(line: 59, column: 5, scope: !78)
!88 = !DILocation(line: 60, column: 5, scope: !78)
!89 = !DILocation(line: 60, column: 25, scope: !78)
!90 = !DILocation(line: 61, column: 5, scope: !78)
!91 = !DILocation(line: 62, column: 5, scope: !78)
!92 = !DILocation(line: 62, column: 27, scope: !78)
!93 = !DILocation(line: 63, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !78, file: !14, line: 63, column: 8)
!95 = !DILocation(line: 63, column: 18, scope: !94)
!96 = !DILocation(line: 63, column: 8, scope: !78)
!97 = !DILocation(line: 66, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !14, line: 64, column: 5)
!99 = !DILocation(line: 67, column: 5, scope: !98)
!100 = !DILocation(line: 71, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !14, line: 69, column: 5)
!102 = !DILocation(line: 71, column: 14, scope: !101)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !14, line: 74, type: !42)
!104 = distinct !DILexicalBlock(scope: !78, file: !14, line: 73, column: 5)
!105 = !DILocation(line: 74, column: 14, scope: !104)
!106 = !DILocation(line: 75, column: 9, scope: !104)
!107 = !DILocation(line: 76, column: 9, scope: !104)
!108 = !DILocation(line: 76, column: 21, scope: !104)
!109 = !DILocation(line: 79, column: 9, scope: !104)
!110 = !DILocation(line: 80, column: 9, scope: !104)
!111 = !DILocation(line: 80, column: 21, scope: !104)
!112 = !DILocation(line: 81, column: 19, scope: !104)
!113 = !DILocation(line: 81, column: 9, scope: !104)
!114 = !DILocation(line: 83, column: 1, scope: !78)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!116 = !DILocalVariable(name: "data", scope: !115, file: !14, line: 88, type: !3)
!117 = !DILocation(line: 88, column: 12, scope: !115)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !14, line: 89, type: !3)
!119 = !DILocation(line: 89, column: 12, scope: !115)
!120 = !DILocation(line: 89, column: 36, scope: !115)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !14, line: 90, type: !3)
!122 = !DILocation(line: 90, column: 12, scope: !115)
!123 = !DILocation(line: 90, column: 37, scope: !115)
!124 = !DILocation(line: 91, column: 5, scope: !115)
!125 = !DILocation(line: 92, column: 5, scope: !115)
!126 = !DILocation(line: 92, column: 25, scope: !115)
!127 = !DILocation(line: 93, column: 5, scope: !115)
!128 = !DILocation(line: 94, column: 5, scope: !115)
!129 = !DILocation(line: 94, column: 27, scope: !115)
!130 = !DILocation(line: 95, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !115, file: !14, line: 95, column: 8)
!132 = !DILocation(line: 95, column: 18, scope: !131)
!133 = !DILocation(line: 95, column: 8, scope: !115)
!134 = !DILocation(line: 98, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !14, line: 96, column: 5)
!136 = !DILocation(line: 98, column: 14, scope: !135)
!137 = !DILocation(line: 99, column: 5, scope: !135)
!138 = !DILocalVariable(name: "dest", scope: !139, file: !14, line: 101, type: !42)
!139 = distinct !DILexicalBlock(scope: !115, file: !14, line: 100, column: 5)
!140 = !DILocation(line: 101, column: 14, scope: !139)
!141 = !DILocation(line: 102, column: 9, scope: !139)
!142 = !DILocation(line: 103, column: 9, scope: !139)
!143 = !DILocation(line: 103, column: 21, scope: !139)
!144 = !DILocation(line: 106, column: 9, scope: !139)
!145 = !DILocation(line: 107, column: 9, scope: !139)
!146 = !DILocation(line: 107, column: 21, scope: !139)
!147 = !DILocation(line: 108, column: 19, scope: !139)
!148 = !DILocation(line: 108, column: 9, scope: !139)
!149 = !DILocation(line: 110, column: 1, scope: !115)
