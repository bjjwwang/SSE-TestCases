; ModuleID = 'mac_bc/pass/BASIC_array_func_2.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_func_2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.A = type { i32, i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i64 @getValue(%struct.A* noundef %arr, i32 noundef %x) #0 !dbg !9 {
entry:
  %retval = alloca %struct.A, align 4
  %arr.addr = alloca %struct.A*, align 8
  %x.addr = alloca i32, align 4
  store %struct.A* %arr, %struct.A** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.A** %arr.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load %struct.A*, %struct.A** %arr.addr, align 8, !dbg !25
  %1 = load i32, i32* %x.addr, align 4, !dbg !26
  %idxprom = sext i32 %1 to i64, !dbg !25
  %arrayidx = getelementptr inbounds %struct.A, %struct.A* %0, i64 %idxprom, !dbg !25
  %2 = bitcast %struct.A* %retval to i8*, !dbg !25
  %3 = bitcast %struct.A* %arrayidx to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 4 %3, i64 8, i1 false), !dbg !25
  %4 = bitcast %struct.A* %retval to i64*, !dbg !27
  %5 = load i64, i64* %4, align 4, !dbg !27
  ret i64 %5, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [2 x %struct.A], align 16
  %res = alloca %struct.A, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x %struct.A]* %a, metadata !31, metadata !DIExpression()), !dbg !35
  %arrayidx = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 0, !dbg !36
  %a1 = getelementptr inbounds %struct.A, %struct.A* %arrayidx, i32 0, i32 0, !dbg !37
  store i32 10, i32* %a1, align 16, !dbg !38
  %arrayidx2 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 0, !dbg !39
  %b = getelementptr inbounds %struct.A, %struct.A* %arrayidx2, i32 0, i32 1, !dbg !40
  store i32 11, i32* %b, align 4, !dbg !41
  %arrayidx3 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 1, !dbg !42
  %a4 = getelementptr inbounds %struct.A, %struct.A* %arrayidx3, i32 0, i32 0, !dbg !43
  store i32 20, i32* %a4, align 8, !dbg !44
  %arrayidx5 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 1, !dbg !45
  %b6 = getelementptr inbounds %struct.A, %struct.A* %arrayidx5, i32 0, i32 1, !dbg !46
  store i32 21, i32* %b6, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata %struct.A* %res, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 0, !dbg !50
  %call = call i64 @getValue(%struct.A* noundef %arraydecay, i32 noundef 1), !dbg !51
  %0 = bitcast %struct.A* %res to i64*, !dbg !51
  store i64 %call, i64* %0, align 4, !dbg !51
  %b7 = getelementptr inbounds %struct.A, %struct.A* %res, i32 0, i32 1, !dbg !52
  %1 = load i32, i32* %b7, align 4, !dbg !52
  %cmp = icmp eq i32 %1, 21, !dbg !53
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !54
  ret i32 0, !dbg !55
}

declare void @svf_assert(i1 noundef zeroext) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_func_2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "getValue", scope: !10, file: !10, line: 13, type: !11, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!10 = !DIFile(filename: "src/pass/BASIC_array_func_2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !19, !17}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "A", file: !10, line: 11, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !10, line: 8, size: 64, elements: !15)
!15 = !{!16, !18}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !14, file: !10, line: 9, baseType: !17, size: 32)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !14, file: !10, line: 10, baseType: !17, size: 32, offset: 32)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!20 = !{}
!21 = !DILocalVariable(name: "arr", arg: 1, scope: !9, file: !10, line: 13, type: !19)
!22 = !DILocation(line: 13, column: 15, scope: !9)
!23 = !DILocalVariable(name: "x", arg: 2, scope: !9, file: !10, line: 13, type: !17)
!24 = !DILocation(line: 13, column: 24, scope: !9)
!25 = !DILocation(line: 14, column: 12, scope: !9)
!26 = !DILocation(line: 14, column: 16, scope: !9)
!27 = !DILocation(line: 14, column: 5, scope: !9)
!28 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !29, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!29 = !DISubroutineType(types: !30)
!30 = !{!17}
!31 = !DILocalVariable(name: "a", scope: !28, file: !10, line: 18, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 2)
!35 = !DILocation(line: 18, column: 7, scope: !28)
!36 = !DILocation(line: 19, column: 5, scope: !28)
!37 = !DILocation(line: 19, column: 10, scope: !28)
!38 = !DILocation(line: 19, column: 12, scope: !28)
!39 = !DILocation(line: 20, column: 5, scope: !28)
!40 = !DILocation(line: 20, column: 10, scope: !28)
!41 = !DILocation(line: 20, column: 12, scope: !28)
!42 = !DILocation(line: 21, column: 5, scope: !28)
!43 = !DILocation(line: 21, column: 10, scope: !28)
!44 = !DILocation(line: 21, column: 12, scope: !28)
!45 = !DILocation(line: 22, column: 5, scope: !28)
!46 = !DILocation(line: 22, column: 10, scope: !28)
!47 = !DILocation(line: 22, column: 12, scope: !28)
!48 = !DILocalVariable(name: "res", scope: !28, file: !10, line: 23, type: !13)
!49 = !DILocation(line: 23, column: 7, scope: !28)
!50 = !DILocation(line: 23, column: 22, scope: !28)
!51 = !DILocation(line: 23, column: 13, scope: !28)
!52 = !DILocation(line: 24, column: 20, scope: !28)
!53 = !DILocation(line: 24, column: 22, scope: !28)
!54 = !DILocation(line: 24, column: 5, scope: !28)
!55 = !DILocation(line: 25, column: 5, scope: !28)
